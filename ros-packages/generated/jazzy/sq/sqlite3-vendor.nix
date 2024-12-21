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
  version = "0.26.6-1";
  src = finalAttrs.passthru.sources."sqlite3_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sqlite3_vendor" = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "9ab7323e57bf65fa3845c5e4cc3c38ad370b33a4";
        hash = "sha256-5+VfWA4qt/DOdQfXCGrMfIUi0fqUQdcyuYEkcBl105w=";
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
          to = "VCS_TYPE path VCS_URL ${sources."sqlite3_vendor/sqlite-amalgamation-3370200"}";
        }
      ];
    };
    "sqlite3_vendor/sqlite-amalgamation-3370200" = substituteSource {
      src = fetchzip {
        name = "sqlite-amalgamation-3370200-source";
        url = "https://www.sqlite.org/2022/sqlite-amalgamation-3370200.zip";
        hash = "sha256-L7BvZlrl+9AlE42C1PszvjE9byi2qtcbfNiotUYInmc=";
      };
    };
  });
  meta = {
    description = "SQLite 3 vendor package";
  };
})
