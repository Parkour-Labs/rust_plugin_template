/// Dummy method required to prevent static library from being "optimised out".
/// Do not modify or remove.
#[no_mangle]
pub extern "C" fn theprojectname_dummy_method() {}

/// Library function goes here.
#[no_mangle]
pub extern "C" fn theprojectname_add(a: u64, b: u64) -> u64 {
  a + b
}
