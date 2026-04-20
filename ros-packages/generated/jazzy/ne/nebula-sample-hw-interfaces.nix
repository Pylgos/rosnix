{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-hw-interfaces,
  nebula-sample-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_sample_hw_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_sample_hw_interfaces";
  nativeBuildInputs = [ autoware-cmake ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-sample-common ];
  buildInputs = [ autoware-cmake ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-sample-common ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_sample_hw_interfaces" = substituteSource {
      src = fetchgit {
        name = "nebula_sample_hw_interfaces-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "9bfea2f7bfeeebdd297f067e82b5b31dbf587555";
        hash = "sha256-h6KmftCrxduDKzQFcjcobry1JmcICWf63VddGfF36fI=";
      };
    };
  });
  meta = {
    description = "Nebula Sample HW Interfaces";
  };
})
