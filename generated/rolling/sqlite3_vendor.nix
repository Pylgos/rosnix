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
        rev = "b631ab8b39445fd5e09f0bb3ba797acd87e444e8";
        hash = "sha256-GocarEm2IX4uwhSIy81nj5SnEVe939dJS6FOOaLcj74=";
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
  version = "0.28.0-1";
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
