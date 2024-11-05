{
  action-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ptz_action_server_msgs" = substituteSource {
      src = fetchgit {
        name = "ptz_action_server_msgs-source";
        url = "https://github.com/clearpath-gbp/ptz_action_server-release.git";
        rev = "505ffae6af784a7695caeca0157829d6c48a097e";
        hash = "sha256-+Drez6sZrls2CmSAqheOy8WoDquHmOOOSPwWlFs8kfQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ptz_action_server_msgs";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."ptz_action_server_msgs";
  nativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Messages for controlling Pan-Tilt and Pan-Tilt-Zoom devices";
  };
})
