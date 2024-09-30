{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  marti-introspection-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  ros2topic,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "swri_cli_tools" = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "e22f7603d5cdefc019d425ddb587eb875b0930e0";
        hash = "sha256-+KMCtFe8+XjU+SFjS+H4Jmexp8YCW+t4IBLP3dQT10Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "swri_cli_tools";
  version = "3.7.3-1";
  src = sources."swri_cli_tools";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-natsort" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
}
