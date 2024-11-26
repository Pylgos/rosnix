{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcss3d-agent-msgs,
  rosSystemPackages,
  soccer-vision-3d-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcss3d_agent_msgs_to_soccer_interfaces";
  version = "0.4.1-4";
  src = finalAttrs.passthru.sources."rcss3d_agent_msgs_to_soccer_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcss3d-agent-msgs soccer-vision-3d-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_agent_msgs_to_soccer_interfaces" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs_to_soccer_interfaces-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "db5b91ed8ecfb5f0f7ac66b88749763d3c33d0ad";
        hash = "sha256-2bEjbfPy02UiTflYzF8AZb2bjZB/Xg1iHUC0deLs7UQ=";
      };
    };
  });
  meta = {
    description = "Library with methods that convert rcss3d_agent_msgs to soccer_interfaces";
  };
})
