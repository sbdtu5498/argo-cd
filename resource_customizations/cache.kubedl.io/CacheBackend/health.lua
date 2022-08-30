hs = {}
if obj.status ~= nil then
  if obj.status. ~= nil then
    for condition in obj.status.cacheStatus do
      if condition. == "PVCCreated" then
        hs.status = "Healthy"
        hs.message = condition.message
        return hs
      end
      if condition.type == "PVCCreating" then
        hs.status = "Progressing"
        hs.message = condition.message
        return hs
      end
      if condition.type == "CacheFailed" then
        hs.status = "Degraded"
        hs.message = condition.message
        return hs
      end
      if condition.type == "CacheCreating" then
        hs.status = "Progressing"
        hs.message = condition.message
        return hs
      end
    end
  end
end

hs.status = "Progressing"
hs.message = "Waiting for CacheBackend"
return hs

