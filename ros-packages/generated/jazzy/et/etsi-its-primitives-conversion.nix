{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_primitives_conversion";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_primitives_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_primitives_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_primitives_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "c5edb75b75d503c1da1ca3a2f34eb321925e0b6f";
        hash = "sha256-3nUC0GR8zjj8HI3/+ykenwOvUs6OeFiKx0drkmpWdo0=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS primitives to and from ASN.1-encoded primitives";
  };
})
