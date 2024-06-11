classdef audioCache < handle
  % audioCache  Simple class for caching audio data.
  %
  %   audioCache class implements cache storage for caching audio data based
  %   on integer and string features.
  %
  %   (c) 2023 by Oktay Alkin
  %
  % audioCache Methods:
  %
  %   addEntry - Adds a new entry to cache.
  %
  %   search - Searches the cache for an entry with specifid integer and
  %              string features. If found, its data is returned.
  %
  %   reset - Resets cache storage.

  properties
    cacheStorage = {}
  end

  methods

    function addEntry(obj, intFeatures, strFeatures, data)
      obj.cacheStorage(end+1,:) = {intFeatures,strFeatures,data};
    end    

    function data = search(obj, intFeatures, strFeatures)
      [numRows,~] = size(obj.cacheStorage);
      if numRows == 0
        data = [];
      else
        data = [];
        for i=1:numRows
          row = obj.cacheStorage(i,:);
          element1 = row{1};
          if isequal(element1,intFeatures)
            element2 = row{2};
            if isequal(element2,strFeatures)
              data = row{3};
            end
          end
        end
      end
    end

    function release(obj)
      obj.cacheStorage = {};
    end

    function reset(obj)
      obj.cacheStorage = {};
    end

  end % methods

end % classdef