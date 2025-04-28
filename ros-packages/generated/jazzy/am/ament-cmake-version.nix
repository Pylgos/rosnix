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
  pname = "ament_cmake_version";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_version";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_version" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_version-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e69f24ee363a2d6a744feb62da4c5ef2b6081614";
        hash = "sha256-fjVoNGZYzyl5Jb7Uhxa9pl4n0T65gr6TVFzUSAO9Lcw=";
      };
    };
  });
  meta = {
    description = "The ability to override the exported package version in the ament buildsystem.";
  };
})
