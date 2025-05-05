{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-components,
  rcss3d-agent,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcss3d_agent_basic";
  version = "0.4.1-4";
  src = finalAttrs.passthru.sources."rcss3d_agent_basic";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp-components rcss3d-agent ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp-components rcss3d-agent ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_agent_basic" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_basic-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "eca722d4386f3ff65accb38b49054b6c848b9c53";
        hash = "sha256-nDJGmIM8WHHjNPs3KRLNXOf8EM2VIwF9YZX1CVE662Q=";
      };
    };
  });
  meta = {
    description = "Basic rcss3d agent node that uses rcss3d_agent_msgs";
  };
})
