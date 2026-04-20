{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-continental-common,
  nebula-core-common,
  nebula-core-hw-interfaces,
  nebula-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_continental_hw_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_continental_hw_interfaces";
  nativeBuildInputs = [ autoware-cmake ];
  propagatedNativeBuildInputs = [ nebula-continental-common nebula-core-common nebula-core-hw-interfaces nebula-msgs ];
  buildInputs = [ autoware-cmake ];
  propagatedBuildInputs = [ nebula-continental-common nebula-core-common nebula-core-hw-interfaces nebula-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_continental_hw_interfaces" = substituteSource {
      src = fetchgit {
        name = "nebula_continental_hw_interfaces-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "6fcec37084014842a224f0491d1f0522aa59163e";
        hash = "sha256-qwlzOg3ag4G8HrkjFzB4ZLK3fsHixJTYvlwFpFjIOlI=";
      };
    };
  });
  meta = {
    description = "Nebula HW Interfaces Continental";
  };
})
