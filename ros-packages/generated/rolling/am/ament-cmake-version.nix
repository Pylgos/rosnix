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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_version";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_version" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_version-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "dcc0b7a73bcbfe9e9fbdd0268000e87b022c2c8e";
        hash = "sha256-FqMSncx++fW/f+KU6hL4MKL+UTdQ4rIXtGrmdbGc4hA=";
      };
    };
  });
  meta = {
    description = "The ability to override the exported package version in the ament buildsystem.";
  };
})
