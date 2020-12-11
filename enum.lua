---
--- 借鉴Elixir Enum模块
--- Created by yimt.
--- DateTime: 2020/12/11 上午10:12
---

enum = {}

---
--- 任意一个满足条件的
---
---@param source table @数据源
---@param funcCond function @判断方法,只要存在一个funcCond(value)为true，any返回值为true，否则为false
---@return boolean @返回值true:存在满足条件元素,false:不存在满足条件元素
function enum.any(source, funcCond)
    for _, v in pairs(source, cond) do
        if funcCond(v) then
            return true
        end
    end
    return false
end

---
--- 过滤不符合条件元素
---
---@param source table @数据源
---@param funcCond function @过滤方法,funcCond(value)返回值true保留,false删除
---@return table @新的数据
function enum.filter(source, funcCond)
    local new = {}

    for _, v in pairs(source) do
        if funcCond(v) then
            table.insert(new, v)
        end
    end

    return new
end

---
--- 查找第一个符合条件元素
---
---@param source table @数据源
---@param funcCond function @查询条件,如果funcCond(value)为true满条件,为false不满足条件
---@return any @第一个满足条件的元素,如果没有满足条件返回nil
function enum.find(source, funcCond)
    for _, v in pairs(source) do
        if funcCond(v) then
            return v
        end
    end

    return nil
end

---
--- 遍历
---
---@param source table @数据源
---@param callback function @回调会将source每个元素都放入callback方法执行一次
function enum.each(source, callback)
    for _, v in ipairs(source, callback) do
        callback(v)
    end
end

return enum