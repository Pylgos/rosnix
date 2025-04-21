{
  ament-cmake-ros-core,
  buildAmentCmakePackage,
  fastcdr,
  fastdds,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_dynamic_typesupport_fastrtps";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport_fastrtps";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcpputils ];
  propagatedBuildInputs = [ fastcdr fastdds rcutils rosidl-dynamic-typesupport ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_dynamic_typesupport_fastrtps" = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport_fastrtps-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport_fastrtps-release.git";
        rev = "dc11bd643811786c143dc934e4c4cf129aacdc41";
        hash = "sha256-HJAk+29JiGXpIgD9uXwnwRmthQnh6u+ksIlqv2zf6zY=";
      };
    };
  });
  meta = {
    description = "FastDDS serialization support implementation for use with C/C++.";
  };
})
