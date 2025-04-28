{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_export_include_directories";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_include_directories";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_include_directories" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "732f5f0fd96c818cce6dd81f93b7184258e784cb";
        hash = "sha256-wQ/BZoml6mBcPR7zKx0JwG9AFoy+DlxIWy1vex2Dq84=";
      };
    };
  });
  meta = {
    description = "The ability to export include directories to downstream packages in the ament buildsystem in CMake.";
  };
})
