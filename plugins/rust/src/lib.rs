mod wasmtorio_api;
mod wasmtorio_helpers;

use wasmtorio_api::Script;

#[no_mangle]
pub fn add_five_i32(number: i32) -> i32 {
    // let text = format!("Argument was {number} and it is awesome.");
    let text = "Hello!";
    let byte = text.as_bytes()[number as usize] as i32;
    Script::print(text);
    number + byte
}

// #[no_mangle]
// pub fn add_five_i64(number: i64) -> i64 {
//     number.wrapping_add(5)
// }

// #[no_mangle]
// pub fn add_five_f32(number: f32) -> f32 {
//     number + 5.0
// }

// #[no_mangle]
// pub fn add_five_f64(number: f64) -> f64 {
//     number + 5.0
// }

#[link(wasm_import_module = "wasmtorio_game_script")]
extern "C" {
    fn print(message_start: i32, message_length: i32);
}
