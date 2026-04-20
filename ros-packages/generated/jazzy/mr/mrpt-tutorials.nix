{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mvsim,
  rosSystemPackages,
  substituteSource,
  teleop-twist-keyboard,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_tutorials";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."mrpt_tutorials";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mvsim teleop-twist-keyboard ];
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mvsim teleop-twist-keyboard ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_tutorials" = substituteSource {
      src = fetchgit {
        name = "mrpt_tutorials-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "4b8ee34663257fa6b3253a281218eeb6d7c0016f";
        hash = "sha256-1R0hOQZAlJAChZ7oXWK+PrY2MUc/xEaBZmYa+WcALhM=";
      };
    };
  });
  meta = {
    description = "Example files used as tutorials for MRPT ROS packages";
  };
})
