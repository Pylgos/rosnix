{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-hw-interfaces,
  nebula-msgs,
  nebula-robosense-common,
  robosense-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_robosense_hw_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_robosense_hw_interfaces";
  nativeBuildInputs = [ autoware-cmake ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-msgs nebula-robosense-common robosense-msgs ];
  buildInputs = [ autoware-cmake ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-msgs nebula-robosense-common robosense-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_robosense_hw_interfaces" = substituteSource {
      src = fetchgit {
        name = "nebula_robosense_hw_interfaces-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "948d3fe9b72042bad0a835436ee37ba278dd081e";
        hash = "sha256-hXnKlfu/JcpIErcjV6A7SGnFPX0df3MihveuJs0pdhY=";
      };
    };
  });
  meta = {
    description = "Nebula HW Interfaces Robosense";
  };
})
