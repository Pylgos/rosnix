{
  ament-cmake,
  ament-cmake-vendor-package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "sqlite3_vendor" = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "b2f5a938146aaca9afc05c22d1da949082e1f4de";
        hash = "sha256-kvUyueoI8OEN7B1xkxROS9BbyVFy4AWttVsgK2X7ZUE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE zip";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://www.sqlite.org/2024/sqlite-amalgamation-3450100.zip";
          to = "VCS_TYPE path VCS_URL ${sources."sqlite3_vendor/sqlite-amalgamation-3450100"}";
        }
      ];
    };
    "sqlite3_vendor/sqlite-amalgamation-3450100" = substituteSource {
      src = fetchzip {
        name = "sqlite-amalgamation-3450100-source";
        url = "https://www.sqlite.org/2024/sqlite-amalgamation-3450100.zip";
        hash = "sha256-bJoMjirsBjm2Qk9KPiy3yV3+8b/POlYe76/FQbciHro=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "sqlite3-vendor";
  version = "0.29.0-1";
  src = sources."sqlite3_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
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