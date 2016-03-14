##
## Copyright [2013-2016] [Megam Systems]
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
class BucketsLister

  def initialize(ceph_parms)
    @ceph_helper = CephHelper.new(ceph_parms)
  end

  def buckets
    @ceph_helper.ceph_buckets
  end

  def listed(email)
    calculate.listed(email)
  end

  private

  def calculate
     @calculated = BucketsCalculator.new(buckets)

    return @calculated if @calculated.present?
    
    raise Nilavu::NotFound
  end

end
