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
        rev = "700363b667895d30d6670e3e097623462f34cc41";
        hash = "sha256-d42W+4HLC4Q8TCe25XwXRCPf0y7vJFmfKMZ+/ozS/sQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_dynamic_typesupport_fastrtps";
  version = "0.1.0-3";
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
