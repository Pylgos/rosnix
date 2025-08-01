{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_gz_worlds";
  version = "2.0.2-2";
  src = finalAttrs.passthru.sources."leo_gz_worlds";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_worlds" = substituteSource {
      src = fetchgit {
        name = "leo_gz_worlds-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "f86faa7d526bc931186ffa1361bbc95ed632ddee";
        hash = "sha256-674NiKh1xlcd1MnTOQC9NNU0CnfaJcDqSyS9nNUQ4rY=";
      };
    };
  });
  meta = {
    description = "Gazebo worlds for Leo Rover simulation in ROS 2";
  };
})
