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
  version = "2.2.1-1";
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
        rev = "702920bfe55a7b49c38f7ff4f69119361e59c16a";
        hash = "sha256-k96ZKLyVvJ9smLG32kWaPsdp5ZmUkQoO84LIAoj6JOw=";
      };
    };
  });
  meta = {
    description = "Example files used as tutorials for MRPT ROS packages";
  };
})
