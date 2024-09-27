{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp_components,
  rcss3d_agent,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_agent_basic-83f3365fc34367897fbfbf27e8679063c155f695 = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_basic-83f3365fc34367897fbfbf27e8679063c155f695-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "83f3365fc34367897fbfbf27e8679063c155f695";
        hash = "sha256-nDJGmIM8WHHjNPs3KRLNXOf8EM2VIwF9YZX1CVE662Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_basic";
  version = "0.4.1-3";
  src = sources.rcss3d_agent_basic-83f3365fc34367897fbfbf27e8679063c155f695;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp_components rcss3d_agent ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Basic rcss3d agent node that uses rcss3d_agent_msgs";
  };
}
