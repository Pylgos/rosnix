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
  version = "3.2.1-1";
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
        rev = "b990a8836ac8cbff0cffd88508d5fa74a2fdb65d";
        hash = "sha256-i9GZ/mmxREbrz12hkBBxXHF/5diNCl3IKCG2eUfm+7s=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS primitives to and from ASN.1-encoded primitives";
  };
})
