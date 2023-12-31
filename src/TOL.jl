module TOL

using Dates
import Base: ∈
import Base: ∩
import Base: ∪ 
import Base: -
import Base: ==
import Base: show
import Base: range

## Declaration of types and structs for temporal settings

abstract type AbstractFechado end
abstract type AtomicFechado <: AbstractFechado end

export AbstractFechado
export AtomicFechado

function ∈(a_date::Tt,FeAt::AF)::Bool where {Tt<:TimeType, AF<:AtomicFechado}
    is_in = f_is_in(FeAt)(a_date) == n(FeAt) ? true : false
    return is_in
end

export Atomic
include("Fechados/Atomic.jl")

export Day_of_Month
include("Fechados/Day_of_Month.jl")

export Day_of_Week
include("Fechados/Day_of_Week.jl")

export Month_of_Year
include("Fechados/Month_of_Year.jl")

## Declaration of operators and composed temporal types

export IntFechados
export UnFechados
export ==
export ∈
export ∩
export ∪
export -
export C
export Ω
export succ
export prec
export n, range, f_is_in
include("Utilities.jl")

end
