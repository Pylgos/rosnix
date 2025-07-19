{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmi-adapter,
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fmi_adapter_examples";
  version = "2.1.2-3";
  src = finalAttrs.passthru.sources."fmi_adapter_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ fmi-adapter launch launch-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fmi-adapter launch launch-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fmi_adapter_examples" = substituteSource {
      src = fetchgit {
        name = "fmi_adapter_examples-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "5154bb0e7e24ef79daeb2d6ae6dd861becb5129a";
        hash = "sha256-FNLnKvCy1QMsMlkdwfiwnupdtP9U06oTSPaQTkp7XOA=";
      };
    };
  });
  meta = {
    description = "Provides small examples for use of the fmi_adapter package";
  };
})
