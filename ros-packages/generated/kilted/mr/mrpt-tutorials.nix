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
  version = "2.2.3-1";
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
        rev = "36bee29af206a57cdbf67d7c6ac76e4d211df19b";
        hash = "sha256-1ZgttimYsuGdfQNHFR8Fg7I5kgwFn/ryfwQApCciUPU=";
      };
    };
  });
  meta = {
    description = "Example files used as tutorials for MRPT ROS packages";
  };
})
