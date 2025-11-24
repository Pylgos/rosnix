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
  version = "0.5.1-1";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport_fastrtps";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ fastcdr fastdds rcpputils rcutils rosidl-dynamic-typesupport ];
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ fastcdr fastdds rcpputils rcutils rosidl-dynamic-typesupport ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_dynamic_typesupport_fastrtps" = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport_fastrtps-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport_fastrtps-release.git";
        rev = "eb067aca0d79091dc631b0cd174091575b2f6bf6";
        hash = "sha256-4ngws86w6CzhTSzPTPlQGvO05vkHXG6pso7etObyz6c=";
      };
    };
  });
  meta = {
    description = "FastDDS serialization support implementation for use with C/C++.";
  };
})
