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
  version = "0.1.2-1";
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
        rev = "edc224de267ba475cd716c5a787ac099000e2c9c";
        hash = "sha256-yDw2YRoo7d3hMAlVjAWX4laq9/v71aTNy95loMEZWaI=";
      };
    };
  });
  meta = {
    description = "Files used in the agent tutorials";
  };
})
