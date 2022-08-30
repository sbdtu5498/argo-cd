hs = {}
if obj.status ~= nil then
  if obj.status.conditions ~= nil then
    for condition in obj.status.condition do
      if condition.type == "Created"
        hs.status = "Healthy"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Running"
        hs.status = "Progressing"
        hs.message = condition.message
        return hs
      end
      if condition.type == "Terminated"
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      end
    end
  end
end

hs.status = "Progressing"
hs.message = "Waiting for Notebook"
return hs

