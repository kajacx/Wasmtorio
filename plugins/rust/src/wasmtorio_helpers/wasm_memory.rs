pub type FatPtr = (i32, i32);

pub fn string_to_fat_ptr(string: &str) -> FatPtr {
    bytes_to_fat_ptr(string.as_bytes())
}

pub fn bytes_to_fat_ptr(bytes: &[u8]) -> FatPtr {
    (bytes.as_ptr() as usize as i32, bytes.len() as i32)
}
