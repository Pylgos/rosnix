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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_primitives_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_primitives_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_primitives_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "192f42a772c09803d01308f9d0b622381b6cbd17";
        hash = "sha256-+Zo088KtZBDRPXKHUr0aZaOSUVTBWQ9dVQphU90Nx9U=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS primitives to and from ASN.1-encoded primitives";
  };
})
