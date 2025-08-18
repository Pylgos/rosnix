{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cx-bringup,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_tutorial_agents";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."cx_tutorial_agents";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-bringup ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-bringup ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_tutorial_agents" = substituteSource {
      src = fetchgit {
        name = "cx_tutorial_agents-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "ef56b09585d4f48fa4c5509980805b8af6537775";
        hash = "sha256-wpmWyE8e+A1dgfK4zAcfjj8ccd28F2T9DtDfNZ/FybU=";
      };
    };
  });
  meta = {
    description = "Files used in the agent tutorials";
  };
})
