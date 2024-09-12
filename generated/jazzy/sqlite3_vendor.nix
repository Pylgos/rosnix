{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  sqlite,
  substituteSource,
}:
let
  sources = rec {
    sqlite3_vendor = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2569c44dcd8d445cd1c163c80e3c96b109b19953";
        hash = "sha256-Q8olSUz24poVU9f/oi+BMW3zUOhL0yuFXwlRcYPsg9U=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE zip";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://www.sqlite.org/2022/sqlite-amalgamation-3370200.zip";
          to = "VCS_TYPE path VCS_URL ${sqlite3_vendor-vendor_source-sqlite-amalgamation-3370200-0}";
        }
      ];
    };
    sqlite3_vendor-vendor_source-sqlite-amalgamation-3370200-0 = substituteSource {
      src = fetchzip {
        name = "sqlite3_vendor-vendor_source-sqlite-amalgamation-3370200-0-source";
        url = "https://www.sqlite.org/2022/sqlite-amalgamation-3370200.zip";
        hash = "sha256-L7BvZlrl+9AlE42C1PszvjE9byi2qtcbfNiotUYInmc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sqlite3_vendor";
  version = "0.26.5-1";
  src = sources.sqlite3_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sqlite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "SQLite 3 vendor package";
  };
}
