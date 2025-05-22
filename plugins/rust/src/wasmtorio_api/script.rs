pub struct Script;

use crate::wasmtorio_helpers::string_to_fat_ptr;

impl Script {
    pub fn print(message: &str) {
        let fat_ptr = string_to_fat_ptr(message);
        unsafe { crate::print(fat_ptr.0, fat_ptr.1) }
    }
}
