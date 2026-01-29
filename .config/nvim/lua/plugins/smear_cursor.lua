return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- SMEAR SETTINGS
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,

    -- SPEED & SMOOTHNESS (zlep zlep ultra cepet!)
    stiffness = 0.8,
    trailing_stiffness = 0.6,
    distance_stop_animating = 0.5,
    hide_target_hack = true,

    -- TIMING (optimized buat 60fps kitty)
    time_interval = 8,

    -- DAMPING (smooth banget)
    damping = 0.95,
    trailing_exponent = 0,

    -- COLOR (Miku Pink Theme!)
    cursor_color = "#ff6ec7",
    
    -- MATRIX EFFECT
    matrix_pixel_threshold = 0.8,
    
    -- GRADIENT (biar smear keliatan lebih smooth)
    gradient_exponent = 1,
    gamma = 1,
  },
}
