{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sqlite3_vendor";
  version = "0.33.0-1";
  src = finalAttrs.passthru.sources."sqlite3_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libsqlite3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sqlite3_vendor" = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "3f843a46082c1fda1f2ac39cffce39c05f09aa92";
        hash = "sha256-VFdV8Dv7SA/AixzWWsfHmwyyR28hIJaa6gGLgJ2FNMM=";
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
    };
  });
  meta = {
    description = "SQLite 3 vendor package";
  };
})
