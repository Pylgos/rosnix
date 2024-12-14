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
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_version";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_version" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_version-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "7fc5b845534e9ca596a4d8a4a21ce7e510e38c79";
        hash = "sha256-BVd7jyhX4TNgCF1a1mrSGI9AfEqbvfezA+3m6IrykIA=";
      };
    };
  });
  meta = {
    description = "The ability to override the exported package version in the ament buildsystem.";
  };
})
