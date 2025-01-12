#![no_std]
#![no_main]

use core::panic::PanicInfo;
use libc::*;

#[no_mangle]
pub unsafe extern "C" fn main(_argc: i32, _argv: *const *const u8) -> usize {
    printf(b"Hello, world!\n".as_ptr() as *const i8);
    0
}

#[panic_handler]
unsafe fn panic_handler(_: &PanicInfo<'_>) -> ! {
    printf(b"PANIK!\n".as_ptr() as *const i8);
    exit(1);
}