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
    sqlite-amalgamation-3450100-vendor_source-1fhy4avl3idgxwg5cfngpzqzwpf9nwn3wjjg8av3j1pc5a70r6kc = substituteSource {
      src = fetchzip {
        name = "sqlite-amalgamation-3450100-vendor_source-1fhy4avl3idgxwg5cfngpzqzwpf9nwn3wjjg8av3j1pc5a70r6kc-source";
        url = "https://www.sqlite.org/2024/sqlite-amalgamation-3450100.zip";
        hash = "sha256-bJoMjirsBjm2Qk9KPiy3yV3+8b/POlYe76/FQbciHro=";
      };
      substitutions = [
      ];
    };
    sqlite3_vendor-b2f5a938146aaca9afc05c22d1da949082e1f4de = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-b2f5a938146aaca9afc05c22d1da949082e1f4de-source";
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
          to = "VCS_TYPE path VCS_URL ${sqlite-amalgamation-3450100-vendor_source-1fhy4avl3idgxwg5cfngpzqzwpf9nwn3wjjg8av3j1pc5a70r6kc}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "sqlite3_vendor";
  version = "0.29.0-1";
  src = sources.sqlite3_vendor-b2f5a938146aaca9afc05c22d1da949082e1f4de;
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
