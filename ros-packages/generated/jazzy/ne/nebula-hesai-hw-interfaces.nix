{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-hw-interfaces,
  nebula-hesai-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_hesai_hw_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_hesai_hw_interfaces";
  nativeBuildInputs = [ autoware-cmake ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-hesai-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-hesai-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_hesai_hw_interfaces" = substituteSource {
      src = fetchgit {
        name = "nebula_hesai_hw_interfaces-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "47a17647f66c620e14bf3329fd76fdceedddb1c8";
        hash = "sha256-2NC0mUe8JwCvTbCnHqcPTd7V/5XYb/6TTPYBjflaye8=";
      };
    };
  });
  meta = {
    description = "Nebula HW Interfaces Hesai";
  };
})
