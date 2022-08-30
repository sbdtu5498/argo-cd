hs = {}
if obj.status ~= nil then
  if obj.status.conditions ~= nil then
    for i, condition in ipairs(obj.status.conditions) do
      if condition.type == "Created" and condition.status == "False" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Created" and condition.status == "True" then
        hs.status = "Progressing"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Running" and condition.status == "False" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Running" and condition.status == "True" then
        hs.status = "Progressing"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Restarting" and condition.status == "False" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Restarting" and condition.status == "True" then
        hs.status = "Progressing"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Succeeded" and condition.status == "False" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Succeeded" and condition.status == "True" then
        hs.status = "Healthy"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Failed" and condition.status == "False" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Failed" and condition.status == "True" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      if condition.type == "Completed" and condition.status == "False" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      if condition.type == "Completed" and condition.status == "True" then
        hs.status = "Succeeded"
        hs.message = condition.message
        return hs
      end
    end
  end
end

hs.status = "Progressing"
hs.message = "Waiting for certificate"
return hs

