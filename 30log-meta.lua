---@meta

---@class _30log_mixin : { [string]:function }

---@class _30log_class : {}
---@field name string # Class' name
---@field super _30log_class # Class that this class inhert from
---@field mixins { [_30log_mixin]:boolean } # The mixins contained in this class
---@field __subclasses { [_30log_class]:boolean } # All classes deriving directly from this class
---@field __instances { [_30log_instance]:boolean } # All instances originating from this class
---
---a table `{}` for injecting their index-value pairs into new instance.
---or it's a class constructor, variable params `...` represents the args passed in by `new` or `create`
---@field init {}|fun(instance:_30log_instance, ...)
---
---@overload fun(...):_30log_instance # a syntactic sugar for `new`
local class = {}

---Prototype as `instantiate(true, class, ...)` with the class constructor call
---@param self _30log_class
---@param ... any
---@return _30log_instance
function class:new(...) end

---Prototype as `instantiate(false, class, ...)` without the class constructor call
---@param self _30log_class
---@param ... any
---@return _30log_instance
function class:create(...) end

---Derives a new class from the specified class
---@param self _30log_class
---@param name string
---@param extra_params {}
---@return _30log_instance
function class:extend(name, extra_params) end

---Indicates whether this class extends in(directly) the `superclass`
---@param self _30log_class
---@param superclass _30log_class
---@return boolean
function class:subclassOf(superclass) end

---Return an array that includes all classes deriving in(directly) from this class
---@param self _30log_class
---@param filter? fun(class:_30log_class, ...):boolean
---@param ... any
---@return _30log_class[]
function class:subclasses(filter, ...) end

---Indicates whether this class derives in(directly) the `subclass`
---@param self _30log_class
---@param subclass _30log_class
---@return boolean
function class:classOf(subclass) end

---Indicates whether this instance is originating from the `fromclass`
---@param self _30log_instance
---@param fromclass _30log_class
---@return boolean
function class:instanceOf(fromclass) end

---Return an array that includes all instances originating in(directly) from this class
---@param self _30log_class
---@param filter? fun(class:_30log_instance, ...):boolean
---@param ... any
---@return _30log_instance[]
function class:instances(filter, ...) end

---Cast this instance to the `toclass`
---@param self _30log_instance
---@param toclass _30log_class
---@return _30log_instance
function class:cast(toclass) end

---Inject one or more mixins into this class
---@param self _30log_class
---@param ... _30log_mixin
---@return _30log_class
function class:with(...) end

---Whether the class or its' superclass have the specified functional unit
---@param self _30log_class
---@param mixin _30log_mixin
---@return boolean
function class:includes(mixin) end

---Remove one or more mixins from this class
---@param self _30log_class
---@param ... _30log_mixin
---@return _30log_class
function class:without(...) end

---@class _30log_instance : _30log_class
---@field class _30log_class # the class of this instance
local instance = {}
