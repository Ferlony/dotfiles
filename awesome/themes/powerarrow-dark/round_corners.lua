local function apply_shape(draw, shape, ...)
  local geo = draw:geometry()
  local shape_args = ...

  local img = cairo.ImageSurface(cairo.Format.A1, geo.width, geo.height)
  local cr = cairo.Context(img)

  cr:set_operator(cairo.Operator.CLEAR)
  cr:set_source_rgba(0,0,0,1)
  cr:paint()
  cr:set_operator(cairo.Operator.SOURCE)
  cr:set_source_rgba(1,1,1,1)

  shape(cr, geo.width, geo.height, shape_args)

  cr:fill()

  draw.shape_bounding = img._native

  cr:set_operator(cairo.Operator.CLEAR)
  cr:set_source_rgba(0,0,0,1)
  cr:paint()
  cr:set_operator(cairo.Operator.SOURCE)
  cr:set_source_rgba(1,1,1,1)

  local border = beautiful.base_border_width
  --local titlebar_height = titlebar.is_enabled(draw) and beautiful.titlebar_height or border
  local titlebar_height = border
  gears.shape.transform(shape):translate(
    border, titlebar_height
  )(
    cr,
    geo.width-border*2,
    geo.height-titlebar_height-border,
    --shape_args
    8
  )

  cr:fill()

  draw.shape_clip = img._native

  img:finish()
end

