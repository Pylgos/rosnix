{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-action,
  rqt-bag,
  rqt-bag-plugins,
  rqt-console,
  rqt-graph,
  rqt-image-view,
  rqt-msg,
  rqt-plot,
  rqt-publisher,
  rqt-py-common,
  rqt-py-console,
  rqt-reconfigure,
  rqt-service-caller,
  rqt-shell,
  rqt-srv,
  rqt-topic,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_common_plugins" = substituteSource {
      src = fetchgit {
        name = "rqt_common_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_common_plugins-release.git";
        rev = "67b5569cee6ac6ea7774944fbc2b9344d3317eac";
        hash = "sha256-rSJ8tB78EOgjtaHw8wleVvW+Rx9+z5d0IAznXj0aKmg=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_common_plugins";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."rqt_common_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt-action rqt-bag rqt-bag-plugins rqt-console rqt-graph rqt-image-view rqt-msg rqt-plot rqt-publisher rqt-py-common rqt-py-console rqt-reconfigure rqt-service-caller rqt-shell rqt-srv rqt-topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "rqt_common_plugins metapackage provides ROS backend graphical tools suite that can be used on/off of robot runtime.";
  };
})
