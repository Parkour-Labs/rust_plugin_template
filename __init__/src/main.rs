use std::{env, fs, path::Path, str};

const PLACEHOLDER: &str = "theprojectname";

fn replace_all(haystack: &[u8], needle: &[u8], replace: &[u8]) -> Option<Vec<u8>> {
  let k = needle.len();
  let mut res = Vec::new();
  let mut f = false;
  let mut i = 0;
  while i < haystack.len() {
    if i + k <= haystack.len() && &haystack[i..i + k] == needle {
      f = true;
      for x in replace {
        res.push(*x);
      }
      i += k;
    } else {
      res.push(*haystack.get(i).unwrap());
      i += 1;
    }
  }
  if f {
    Some(res)
  } else {
    None
  }
}

fn visit(path: &Path, name: &str) {
  let placeholder = PLACEHOLDER.as_bytes();
  if let Ok(entries) = fs::read_dir(path) {
    for entry in entries.flatten() {
      if let Ok(file_type) = entry.file_type() {
        if file_type.is_dir() && entry.file_name() != ".git" && entry.file_name() != "__init__" {
          visit(&entry.path(), name);
        }
        if file_type.is_file() {
          if let Ok(content) = fs::read(entry.path()) {
            if let Some(new_content) = replace_all(&content, placeholder, name.as_bytes()) {
              print!("Replacing in file {} ... ", entry.path().to_str().unwrap_or("?"));
              fs::write(entry.path(), new_content).map_or_else(|_| println!("FAILED"), |_| println!("OK"));
            }
          }
        }
      }
      if let Some(file_name) = entry.file_name().to_str() {
        if let Some(new_file_name) = replace_all(file_name.as_bytes(), placeholder, name.as_bytes()) {
          if let Ok(new_file_name) = str::from_utf8(&new_file_name) {
            print!("Renaming file {} ... ", entry.path().to_str().unwrap_or("?"));
            fs::rename(entry.path(), path.join(new_file_name)).map_or_else(|_| println!("FAILED"), |_| println!("OK"));
          }
        }
      }
    }
  }
}

fn check(name: &str) -> bool {
  if !name.is_ascii() {
    return false;
  }
  for char in name.chars() {
    if !(char.is_ascii_lowercase() || char == '_') {
      return false;
    }
  }
  true
}

fn main() -> Result<(), String> {
  let args: Vec<String> = env::args().collect();
  if let Some(relative) = args.get(1) {
    if let Some(name) = args.get(2) {
      if let Ok(path) = env::current_dir() {
        let path = path.join(relative);
        if check(name) {
          println!(
            "Replacing all occurrences of \"{}\" with \"{}\" in directory {}",
            PLACEHOLDER,
            name,
            path.to_str().unwrap_or("?")
          );
          visit(&path, name);
          Ok(())
        } else {
          Err("Project name may only contain lowercase letters and underscores.".to_string())
        }
      } else {
        Err("Given path is not found.".to_string())
      }
    } else {
      Err("Project name expected.".to_string())
    }
  } else {
    Err("Project directory expected.".to_string())
  }
}
