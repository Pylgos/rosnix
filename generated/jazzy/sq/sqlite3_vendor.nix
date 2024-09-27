{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    sqlite-amalgamation-3370200-vendor_source-0rwy113bba6qghdxgamn51pkscdy6gxx90ld2cjx1yz5b9k6zc1g = substituteSource {
      src = fetchzip {
        name = "sqlite-amalgamation-3370200-vendor_source-0rwy113bba6qghdxgamn51pkscdy6gxx90ld2cjx1yz5b9k6zc1g-source";
        url = "https://www.sqlite.org/2022/sqlite-amalgamation-3370200.zip";
        hash = "sha256-L7BvZlrl+9AlE42C1PszvjE9byi2qtcbfNiotUYInmc=";
      };
      substitutions = [
      ];
    };
    sqlite3_vendor-2569c44dcd8d445cd1c163c80e3c96b109b19953 = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-2569c44dcd8d445cd1c163c80e3c96b109b19953-source";
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
          to = "VCS_TYPE path VCS_URL ${sqlite-amalgamation-3370200-vendor_source-0rwy113bba6qghdxgamn51pkscdy6gxx90ld2cjx1yz5b9k6zc1g}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "sqlite3_vendor";
  version = "0.26.5-1";
  src = sources.sqlite3_vendor-2569c44dcd8d445cd1c163c80e3c96b109b19953;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "SQLite 3 vendor package";
  };
}
