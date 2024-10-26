function framework()
  local function init()
    print("Injected!🚀")
  end

  local function logger(value)
    print(value)
  end

  init()
  return {
    logger = logger
  }
end
return framework()
