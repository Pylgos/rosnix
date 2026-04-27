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
  version = "2.4.0-1";
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
        rev = "c4dcb15f01f5cd7cb5f3ee7da9d4fbcd39e5df63";
        hash = "sha256-D5z1M/olReOM6tyHmBX9g3aEpTXpTgNf9IEvDHnoowE=";
      };
    };
  });
  meta = {
    description = "Example files used as tutorials for MRPT ROS packages";
  };
})
