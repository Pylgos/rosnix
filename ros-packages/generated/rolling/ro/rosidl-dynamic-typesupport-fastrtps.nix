{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fastcdr,
  fastrtps,
  fastrtps-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_dynamic_typesupport_fastrtps" = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport_fastrtps-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport_fastrtps-release.git";
        rev = "2d124c078ca75105570d239d11443b303e86fb8d";
        hash = "sha256-qkfsno56PSSOQcLYr0fAwdLBpXAz/uT5Ngw1Pj240Ec=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_dynamic_typesupport_fastrtps";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport_fastrtps";
  nativeBuildInputs = [ ament-cmake-ros fastrtps-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fastcdr fastrtps rcutils rosidl-dynamic-typesupport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "FastDDS serialization support implementation for use with C/C++.";
  };
})
