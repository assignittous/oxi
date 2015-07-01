
/*

 * Utilities

Utility functions
 */
var fs, logger;

require('sugar');

fs = require('fs');

logger = require('./logger.coffee').Logger;

exports.Utilities = {
  dateSid: function() {
    return Date.create().format("{yyyy}{MM}{dd}{HH}{mm}{ss}{fff}");
  },
  checkExtension: function(path, ext) {
    if (path.endsWith(ext)) {
      return path;
    } else {
      return "" + path + ext;
    }
  },
  getSubDirectories: function(rootDir) {
    var checkPath, dirs, i, len, path, paths, stat;
    paths = fs.readdirSync(rootDir);
    dirs = [];
    for (i = 0, len = paths.length; i < len; i++) {
      path = paths[i];
      if (path[0] !== '.') {
        checkPath = rootDir + "/" + path;
        stat = fs.statSync(checkPath);
        if (stat.isDirectory()) {
          dirs.push(path);
        }
      }
    }
    return dirs;
  },
  deleteFileIfExists: function(path) {
    var e;
    try {
      fs.openSync(path, 'r');
      fs.unlinkSync(path);
      return logger.info("Deleted " + path);
    } catch (_error) {
      e = _error;
      return console.log("can't open");
    } finally {
      console.log("finally");
    }
  }
};
