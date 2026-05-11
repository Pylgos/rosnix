{
  ament-cmake-core,
  ament-cmake-libraries,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_export_dependencies";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "4da77214380c969a5ff9857c41c11499b4c49311";
        hash = "sha256-IcS+WXSQKIRFrd0Kko4HA2zDq4TgYrkyUBFbhUS8i7k=";
      };
    };
  });
  meta = {
    description = "The ability to export dependencies to downstream packages in the ament buildsystem in CMake.";
  };
})
