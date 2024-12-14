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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_version";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_version" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_version-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "90af31b1c6438b05d81647fe231f07a437786f21";
        hash = "sha256-QRbekHrM8/gFRsJzr7U5l6RnQwXca7fq2AagbjgCi4Y=";
      };
    };
  });
  meta = {
    description = "The ability to override the exported package version in the ament buildsystem.";
  };
})
